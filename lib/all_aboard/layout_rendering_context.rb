module AllAboard
  class LayoutRenderingContext
    def initialize(layout)
      @layout = layout
    end

    def content_for_pane(pane_number, pane)
      identifier = "pane-#{pane_number}"
      %{<div class="#{identifier}"></div>}
    end
  end
end
