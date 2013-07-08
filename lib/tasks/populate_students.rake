
desc "populate database"
task :populate_students => [:environment, :load_scraper] do
  student_profiles = StudentScrape.scrape_students.compact
  student_profiles.each do |stud|
      Student.create(:name => stud.name, :image_url => stud.image, :quote => stud.quote, :twitter_url => stud.twitter, :linkedin_url => stud.linkedin, :github_url => stud.github, :blog_url => stud.blog)
   end
 end