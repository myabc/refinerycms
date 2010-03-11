class <%= class_name %>
  include DataMapper::Resource

  # FIXME: for DataMapper port
  #acts_as_indexed :fields => [:<%= attributes.collect{ |attribute| attribute.name if attribute.type.to_s =~ /string|text/ }.compact.uniq.join(", :") %>],
  #                :index_file => [Rails.root.to_s, "tmp", "index"]

  validates_present :<%= attributes.first.name %>
  validates_is_unique :<%= attributes.first.name %>

<% attributes.collect{|a| a if a.type.to_s == 'image'}.compact.uniq.each do |a| -%>
  belongs_to :<%= a.name.gsub("_id", "") %><%= ", :model => 'Image'" unless a.name =~ /^image(_id)?$/ %>
<% end -%>
<% attributes.collect{|a| a if a.type.to_s == 'resource'}.compact.uniq.each do |a| -%>
  belongs_to :<%= a.name.gsub("_id", "") %><%= ", :class_name => 'Resource'" unless a.name =~ /^resource(_id)?$/ %>
<% end -%>


end
