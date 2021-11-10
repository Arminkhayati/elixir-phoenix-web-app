defmodule ZsonlineWeb.CMS.PageView do
  use ZsonlineWeb, :view
  alias Zsonline.CMS

  def author_name(%CMS.Page{author: author})do
    author.user.name
  end

end
