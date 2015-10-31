require "git"

# http://www.rubydoc.info/gems/git/1.2.9.1/Git/Log#path-instance_method

def use_git_data
  puts
  puts "Using git data…"

  git = Git.open(".")

  @items.each do |item|
    next if item.binary?
    next unless item[:content_filename]

    commits = git.log.path(item[:content_filename])

    first_commit = commits.last

    item[:created_at]  = Time.new unless item[:created_at] || first_commit

    next unless first_commit

    item[:modified_at] = []
    commits.each do |commit|
      item[:modified_at] << commit.date.to_time
    end

    item[:created_at]  = first_commit.date.to_time unless item[:created_at]
    item[:author_name] = first_commit.author.name  unless item[:author_name]
  end
end
