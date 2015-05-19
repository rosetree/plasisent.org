require "git"

# http://www.rubydoc.info/gems/git/1.2.9.1/Git/Log#path-instance_method

def use_git_data
  puts
  puts "Using git data…"

  git = Git.open(".")

  @items.each do |item|
    next if item.binary?
    next unless item[:content_filename]

    use_git_date   git, item
    use_git_author git, item
  end
end


def use_git_date git, item
  return if item[:created_at]

  first_commit = git.log.path(item[:content_filename]).last
  item[:created_at] = first_commit.date.to_time
end


def use_git_author git, item
  return if item[:author_name]

  first_commit = git.log.path(item[:content_filename]).last
  item[:author_name] = first_commit.author.name
end
