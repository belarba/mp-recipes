module ApplicationHelper
  def contentful
    @client ||= Contentful::Client.new(
      access_token: '7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c',
      space: 'kk2bw5ojx476',
      dynamic_entries: :auto,
      raise_errors: true
    )
  end
end
