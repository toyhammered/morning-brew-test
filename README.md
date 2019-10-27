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

  Devleoped Features:
  
    1. Most CRUD actions linked up to MorningBrewLyra site
    2. View all Stories and Newsletters
    2. Ability to preview story live (with template provided)
    3. Utilize TinyMCE
    4. Newsletters have many stories (correct nesting)

  Future Features:
  
  1. The big feature would be the flow of this site. I would like the main page to be an SPA (and a couple of erb pages for less important). We would have all the newsletters ordered by date (newest at top) and then a dropdown which would show all related stories. You would be able to modify a newsletter inline. If you clicked on a story, this would be the same as the edit view (you would also just click on the input to edit, similar to newsletter)

  2. As for the associations, I would most likely turn newsletters into a STI or Polymorphic, so we can have multiple types (i.e Main, Tech, Retail, etc...) and be able to share stories between each of them.

  3. There should also be some type of review process related to a story/newsletter to make sure everything looks correct (maybe how Microsoft Word allows others to edit documents/leave notes).

  4. Story collaboration (ability to have multiple authors who worked on a story together)
