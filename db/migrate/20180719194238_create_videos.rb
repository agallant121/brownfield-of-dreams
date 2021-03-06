# rubocop:todo Style/Documentation
# frozen_string_literal: true

class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :video_id
      t.string :thumbnail
    end
  end
end
# rubocop:enable Style/Documentation
