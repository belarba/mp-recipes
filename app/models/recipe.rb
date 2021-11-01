# frozen_string_literal: true

class Recipe
  @@fetched = []

  attr_accessor :id, :title, :image_url, :description, :tags, :chef

  mattr_accessor :fetched

  def initialize(_id, _title, _image_url, _description, _tags, _chef)
    @id = _id
    @title = _title
    @image_url = _image_url
    @description = _description
    @tags = _tags
    @chef = _chef
  end

  def self.fetch_recipes
    @client ||= Contentful::Client.new(
      access_token: '7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c',
      space: 'kk2bw5ojx476',
      environment: 'master',
      dynamic_entries: :auto,
      raise_errors: true
    )
  end

  def self.all
    @@fetched = []
    recipes = fetch_recipes.entries(content_type: 'recipe', include: 2)
    recipes.each do |r|
      tags = r.fields[:tags] ? r.fields[:tags].collect(&:name).join(',') : ''
      chef = r.fields[:chef] ? r.fields[:chef].name : ''
      @@fetched << Recipe.new(
        r.sys[:id],
        r.fields[:title],
        r.fields[:photo].url(width: 800, height: 800, format: 'jpg', quality: 100),
        r.fields[:description],
        tags,
        chef
      )
    end
    @@fetched
  end
end
