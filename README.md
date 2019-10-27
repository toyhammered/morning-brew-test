# Setup
  1. bundle install
  2. rake db:create
  3. rake db:migrate
  4. rails s (tab 1)
  5. bin/webpack --watch --colors --progress (tab 2)

# Additional Notes:
  TODO:
  
    1. Add testing
    2. Add documentation
    3. TinyMce Pro (key seems to not be premium enabled, would normally contact support)
    4. Turn the MorningBrewLyra lib into a gem
    5. Remove jquery and just use pure es6
    6. Live preview for stories is kinda janky, would rethink approach
    7. Add actual ux/ui (currently just crud with basic styles, will go more into in the additional features section).
    8. Inline support for when posting to Lyra

  Features:
  
    1. Most CRUD actions linked up to MorningBrewLyra site
    2. View all Stories and Newsletters
    2. Ability to preview story live (with template provided)
    3. Utilize TinyMCE
    4. Newsletters have many stories (correct nesting)
