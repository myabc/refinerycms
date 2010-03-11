class PagesController < ApplicationController

  def home
    @page = Page.first(:link_url => "/")
    error_404 unless @page.present?
  end

  def show
    @page = Page.get(params[:id])

    if @page.live? or (logged_in? and current_user.authorized_plugins.include?("Pages"))
      # if the admin wants this to be a "placeholder" page which goes to its first child, go to that instead.
      if @page.skip_to_first_child
        first_live_child = @page.children.find_by_draft(false, :order => "position ASC")
        redirect_to first_live_child.url if first_live_child.present?
      end
    else
      error_404
    end
  end

end
