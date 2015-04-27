module Selectables
  class Selectable < ActiveRecord::Base
    validates :category, presence: true

    # will define the first category for selectables options
    @general_categories = [ [I18n.t("selectable.general_category"), "general_category"] ]

    # will adjust the selectables option to the general category
    Selectable.where('category LIKE ?', "general_category" ).each do |category|
      @general_categories << [I18n.t("selectable.#{category.value}"), "#{category.value}"]
    end

    #Use the sort_alphabetical gem to sort the translated values.
    def self.general_category
        @general_categories.sort_alphabetical
    end

    # old bad method?
    # SELECTABLE_CATEGORIES = @general_categories.sort_alphabetical


    # this array [I18n.t(value.selectable_value), value.selectable_value] will provide informations for
    # the select form. The firs value is the translation display for the UI and the second is
    # the value from the option and will be store in the db.

    #build an array of arrays for select2 multiple forms, it actually uses ['value', 'value'] array but you can easily make an ['id','value'] array

    def self.selectable_items(category)
     items = Selectable.where('category LIKE ?', category ).order(:value)
     items.map { |value| [value.value, value.id] }
     # For multilingual selectables uncomment below
     #items.map { |value| [I18n.t(value.value), value.value] }
    end

    #here we are building a single array of values, I used it in my tagging sytem with select 2
    def self.selectable_tags(category)
     items = Selectable.where('category LIKE ?', category ).order(:value)
     items.map { |value| value.value }
     # For multilingual selectables uncomment below
     #items.map { |value| [I18n.t(value.value), value.value] }
    end
  end
end
