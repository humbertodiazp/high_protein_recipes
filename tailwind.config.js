module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    'trix/**/*.js'
  ],
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
  ],

  theme: {
    extend: {
      fontFamily: {
        'sanchez': ['"Sanchez"', 'serif'], 
        'comic-neue': ['"Oxygen"', 'sans-serif'],
      },
    },
  },
  
} 