# frozen_string_literal: true

module RtosHelper
  def rto_action_tags(rto)
    content_tag(:div) do
      tags =  show(rto)
      tags += edit(rto)
      tags += delete(rto)
    end
  end

  def show(rto)
    link_to 'Show', rto_path(rto), class: 'btn btn-light btn-sm m-1 show_model_button'
  end

  def edit(rto)
    link_to 'Edit', edit_rto_path(rto), class: 'btn btn-info btn-sm m-1'
  end

  def delete(rto)
    link_to 'Delete', rto_path(rto), method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-danger btn-sm m-1'
  end
end
