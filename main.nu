def main [url: string] {
  yt-dlp --skip-download --write-auto-subs --sub-format ttml -o out $url
  let result = open out.en.ttml
    | str replace -ar "<p.*\">" ""
    | str replace -a "</p>" ""
    | str replace -a "&#39;" ""
    | str replace -r "</div>(.|\n)*" ""
    | str replace -r "(.|\n)*<div>" ""
  rm out.en.ttml
  echo $result
}
