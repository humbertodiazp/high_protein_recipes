web: bin/rails server -p ${PORT:-5000} -e $RAILS_ENV
worker: sidekiq
css: bin/rails tailwindcss:watch
js: yarn build --watch

release: bin/rails db:migrate
