module ApplicationHelper
  def default_meta_tags
    {
      site: 'ICHIOSHI',
      title: 'みんなのイチオシが集まるプラットフォーム',
      reverse: true,
      charset: 'utf-8',
      description: 'ICHIOSHIはみんなが人におすすめしたい、イチオシのモノが集まるプラットフォームです。',
      keywords: 'ICHIOSHI,イチオシ',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('/assets/ogp.jpg') },
        { href: image_url('/assets/ogp.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: '/assets/ogp.jpg' },
      ],
      og: {
        site_name: :site, # もしくは site_name: :site
        title: :title, # もしくは title: :title
        description: :description, # もしくは description: :description
        type: 'website',
        url: request.original_url,
        image: image_url('/assets/ogp.jpg'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
        site: '@ツイッターのアカウント名',
      }
    }
  end
end
