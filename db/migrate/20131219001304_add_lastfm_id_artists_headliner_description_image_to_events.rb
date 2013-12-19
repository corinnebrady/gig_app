class AddLastfmIdArtistsHeadlinerDescriptionImageToEvents < ActiveRecord::Migration
  def change
    add_column :events, :lastfm_id, :integer
    add_column :events, :artists, :text
    add_column :events, :headliner, :string
    add_column :events, :description, :text
    add_column :events, :image, :text
  end
end
