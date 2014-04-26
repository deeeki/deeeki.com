class PagesController < ApplicationController
  def index
    content = File.read(Rails.root.join('README.md'))
    render text: GitHub::Markdown.render_gfm(content), layout: true
  end
end
