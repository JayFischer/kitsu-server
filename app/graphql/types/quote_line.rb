class Types::QuoteLine < Types::BaseObject
  description 'A line in a quote'

  # Identifiers
  field :id, ID, null: false

  field :quote, Types::Quote,
    null: false,
    description: 'The quote this line is in'

  field :character, Types::Character,
    null: false,
    description: 'The character who said this line'

  def character
    AssociationLoader.for(QuoteLine, :character).load(object)
  end

  field :content, String,
    null: false,
    description: 'The line that was spoken'
end
