#!/bin/bash

cd "$(dirname "$0")"

if [ ! -f ".env" ]; then
  cp .env.example .env
  echo ".env file created from .env.example"
else
  echo ".env file already exists"
fi

echo "Running npm install..."
npm install

echo "Running composer install..."
composer install

echo "Running php artisan key:generate..."
php artisan key:generate

echo "Running php artisan migrate..."
php artisan migrate

echo "Running php artisan db:seed..."
php artisan db:seed

echo "Setup complete!"

