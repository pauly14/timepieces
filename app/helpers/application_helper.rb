module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

  # app/helpers/application_helper.rb


    def resource_name
      :user
    end

    def resource
      @resource ||= User.new
    end

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end
  def add_item_link(text, item)
    link_to_remote text, {:url => {:controller => "cart",
                                   :action => "add", :id => book}},
                   {:title => "Add to Cart",
                    :href => url_for( :controller => "cart",
                                      :action => "add", :id => book)}
  end

  def remove_item_link(text, item)
    link_to_remote text, {:url => {:controller => "cart",
                                   :action => "remove",
                                   :id => book}},
                   {:title => "Remove item",
                    :href => url_for( :controller => "cart",
                                      :action => "remove", :id => book)}
  end

  def clear_cart_link(text = "Clear Cart")
    link_to_remote text,
                   {:url => { :controller => "cart",
                              :action => "clear" }},
                   {:href => url_for(:controller => "cart",
                                     :action => "clear")}
  end
end




