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
        { href: image_url('https://s3-ap-northeast-1.amazonaws.com/tamtim/uploads/favicon.ico'), rel: 'apple-touch-icon', sizes: '180x180', type: 'https://s3-ap-northeast-1.amazonaws.com/tamtim/uploads/favicon.ico' },
      ],
      og: {
        site_name: :site, # もしくは site_name: :site
        title: :title, # もしくは title: :title
        description: :description, # もしくは description: :description
        type: 'website',
        url: request.original_url,
        image: image_url('https://s3-ap-northeast-1.amazonaws.com/tamtim/uploads/favicon.ico'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
        site: '@ツイッターのアカウント名',
      }
    }
  end
end
