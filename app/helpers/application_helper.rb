module ApplicationHelper

  # https://qiita.com/awakia/items/3265f91768bcfd582bd7 を参照。親レイアウトにapplicationを選択した
  def parent_layout(layout)
    @view_flow.append(:layout, self.output_buffer)
    self.output_buffer = render(file: "layouts/#{layout}")
  end

  # サイドバーのactiveをいじって、サイドバーの要素を表示できるようにするメソッド
  def sidebar_link_item(name, path, method="")
    class_name = 'admin-element'
    class_name << ' active' if current_page?(path)

    if method == :delete
      content_tag :li, class: class_name do
        link_to name, path, class: 'admin-element-name', method: method
      end
    else
      content_tag :li, class: class_name do
        link_to name, path, class: 'admin-element-name'
      end
    end
  end
end
