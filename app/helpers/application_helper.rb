module ApplicationHelper
  def default_meta_tags
    {
      site: 'なんJまとめのまとめ',
      keywords: "なんJまとめのまとめ,なんJ,アンテナ,野球,高校野球,5ch,2ch",
      description: "なんでも実況(ジュピター)まとめブログのアンテナサイトです。プロ野球好きにはたまらない野球情報が盛りだくさん！数あるなんJまとめサイトを最新記事からまとめて閲覧することができます。野球,NPB,MLB,なんJ,おんJネタが好きな方にはおすすめ！",
      icon: "favicon.ico",
      author: "https://twitter.com/hbwandeow",
      canonical: "https://matome-nanj.herokuapp.com",
      og: {
        title:    'なんJまとめのまとめ',
        type:     'website',
        url:      'https://matome-nanj.herokuapp.com',
        image:    'favicon.ico',
      }
    }
  end
end
