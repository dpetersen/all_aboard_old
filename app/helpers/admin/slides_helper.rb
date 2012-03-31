module Admin::SlidesHelper
  def sources_and_perspectives
    SourceManager.instance.source_classes.inject([]) do |a, source_class|
      source_class.perspectives.each do |perspective_name|
        friendly_name = "#{source_class.name} - #{perspective_name}"
        databasey_name = "#{source_class},#{perspective_name}"
        a << [ friendly_name, databasey_name ]
      end

      a
    end
  end
end
