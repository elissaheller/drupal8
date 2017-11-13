FROM drupal:8.3.0-apache

RUN apt-get update

RUN apt-get install -y \
  git \
  wget \
  nano

RUN docker-php-ext-install \
  pdo \
  pdo_mysql


# Install composer
RUN wget -qO- https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Cleanup
ENV PATH "~/.composer/vendor/bin:$PATH"

# Install Drupal Console
RUN curl https://drupalconsole.com/installer -o /usr/local/bin/drupal && \
    chmod +x /usr/local/bin/drupal
