require "tmpdir"

GITHUB_REPONAME = "0x1306a94/blog"
GITHUB_REPO_BRANCH = "gh-pages"
DOMAIN = "blog.0x1306a94.com"
DEST = "public/."
IMG_DEST = "static/."

task default: %w[publish]

desc "Generate book static files by Hugo"
task :gen do
  system "hugo"
end

desc "Update content"
task :u do
  system "depctl"
end

desc "Run Hugo server to test"
task :s do 
  system "hugo server --minify --theme book"
end

desc "Generate and publish book to my Repo"
task :publish => [:u, :gen] do
  Dir.mktmpdir do |tmp|
    cp_r DEST, tmp
    pwd = Dir.pwd
    Dir.chdir tmp
    system "echo #{DOMAIN} > CNAME"
    system "git init"
    system "git checkout --orphan #{GITHUB_REPO_BRANCH}"    
    system "git add ."
    msg = "#{Time.now.utc}"
    system "git commit -am '#{msg}: Published'"
    system "git remote add origin git@github.com:#{GITHUB_REPONAME}.git"
    system "git push origin #{GITHUB_REPO_BRANCH} --force"

    Dir.chdir pwd
  end
end