module ApplicationHelper

  # https://qiita.com/awakia/items/3265f91768bcfd582bd7 を参照。親レイアウトにapplicationを選択した
  def parent_layout(layout)
    @view_flow.append(:layout, self.output_buffer)
    self.output_buffer = render(file: "layouts/#{layout}")
  end
end
