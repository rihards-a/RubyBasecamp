class MainController < ApplicationController
  def index
    readme_path = Rails.root.join("README.md")
    @readme_content = Kramdown::Document.new(File.read(readme_path)).to_html.html_safe
  end
end
