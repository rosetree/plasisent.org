require "git"

# http://www.rubydoc.info/gems/git/1.2.9.1/Git/Log#path-instance_method

def use_git_data
  puts
  puts "Using git data…"

  git = Git.open(".")

  @items.each do |item|
    next if item.binary?
    next unless item[:content_filename]

    first_commit = git.log.path(item[:content_filename]).last

    next unless first_commit

    item[:created_at]  = first_commit.date.to_time unless item[:created_at]
    item[:author_name] = first_commit.author.name  unless item[:author_name]
  end
end
