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
        { href: image_url('https://s3-ap-northeast-1.amazonaws.com/tamtim/uploads/favicon.ico') },
        { href: image_url('https://s3-ap-northeast-1.amazonaws.com/tamtim/uploads/ios_icon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
      ],
      og: {
        site_name: :site, # もしくは site_name: :site
        title: :title, # もしくは title: :title
        description: :description, # もしくは description: :description
        type: 'website',
        url: request.original_url,
        image: image_url('https://s3-ap-northeast-1.amazonaws.com/tamtim/uploads/ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@ichioshi_tokyo',
      }
    }
  end
end
