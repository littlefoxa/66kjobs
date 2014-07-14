namespace :dev do

  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", "db:seed", "dev:demo", "dev:fake"]

  desc "create_base_category"
  task :demo => :environment do
    Category.create!(:name => "視覺設計")
    Category.create!(:name => "網站設計")
    Category.create!(:name => "App設計")
    Category.create!(:name => "網路行銷")
  end

  task :fake => :environment do

    Category.all.each do |c|
      5.times do
        create_job(c)
      end
    end
  end

  def create_job(c)

    job = c.jobs.new

    job.title = Faker::Lorem.sentence

    job.description = Faker::Lorem.paragraph(2)
    job.apply_instruction = Faker::Lorem.paragraph(2) + Faker::Internet.email
    job.location = Faker::Address.city
    job.company_name = "#{Faker::Name.first_name} Inc."
    job.email = Faker::Internet.email
    job.url = Faker::Internet.url
    job.lower_bound = 30000
    job.higher_bound = 66000 + rand(200000)
    job.is_published = true


    job.save
  end
end