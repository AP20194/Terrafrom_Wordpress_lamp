resource "aws_instance" "instance" {
  ami           = var.EC2_AMI_ID
  instance_type = var.EC2_INSTANCE_TYPE
  key_name      = var.EC2_KEY_NAME
  subnet_id     = aws_subnet.subnet-public1.id
  vpc_security_group_ids = [aws_security_group.securitygroup.id]

    root_block_device {
    volume_size = 30
    volume_type = "gp3" # General Purpose SSD (gp3)
  }

  tags = {
    Name = var.NAME_EC2
    ec2 = "backup"
  }

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install apache2 -y
    sudo systemctl start apache2
    sudo systemctl enable apache2
    sudo apt install mysql-server -y
    sudo mysql_secure_installation <<EOL

    -y
    -0
    -y
    -y
    -y
    -y
    EOL
    sudo apt install php libapache2-mod-php php-mysql -y
    sudo systemctl restart apache2
    
    # Install WordPress
    wget https://wordpress.org/latest.tar.gz
    tar -xzf latest.tar.gz
    sudo rsync -av wordpress/* /var/www/html/
    sudo chown -R www-data:www-data /var/www/html/
    sudo chmod -R 755 /var/www/html/
    sudo mv /var/www/html/index.html /var/www/html/index.html.bak

    # Create WordPress config
    sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
    sudo sed -i "s/database_name_here/wp_db/" /var/www/html/wp-config.php
    sudo sed -i "s/username_here/wp_user/" /var/www/html/wp-config.php
    sudo sed -i "s/password_here/password/" /var/www/html/wp-config.php

    # Setup MySQL database for WordPress
    sudo mysql -u root -e "CREATE DATABASE wp_db;"
    sudo mysql -u root -e "CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'password';"
    sudo mysql -u root -e "GRANT ALL PRIVILEGES ON wp_db.* TO 'wp_user'@'localhost';"
    sudo mysql -u root -e "FLUSH PRIVILEGES;"

    # Install SSL certificate
    sudo apt install -y certbot python3-certbot-apache
    # sudo certbot --apache --non-interactive --agree-tos --email desai.manoj@xspremier.com --domains tf.gama.every1lending.com --no-redirect

    sudo certbot --apache -d preprod.every1lending.com --non-interactive --agree-tos --email i.o@naac.org --no-redirect

    # Restart Apache
    sudo systemctl restart apache2
    EOF
}

# sudo mysql -u root -p
# USE wp_db;
# UPDATE wp_options SET option_value = 'https://preprod.every1lending.com' WHERE option_name = 'siteurl';
# UPDATE wp_options SET option_value = 'https://preprod.every1lending.com' WHERE option_name = 'home';
# EXIT;