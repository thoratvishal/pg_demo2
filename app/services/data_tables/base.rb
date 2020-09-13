module DataTables
  class Base
    include RtosHelper
    include Rails.application.routes.url_helpers
    include ActionView::Helpers::TagHelper
    include ActionView::Context
    include ActionView::Helpers::UrlHelper
  end
end