class AddAttachmentPosterToFilms < ActiveRecord::Migration
  def up
    add_attachment :films, :poster
  end

  def down
    remove_attachment :films, :poster
  end
end
