<#
# collegue_ad.ps1
# 
# 概要：引数で渡したテキストファイルの各行に記載されたユーザが存在するかActiveDirectoryに確認し，
# 　　　存在するユーザ名をテキストファイルに出力する．
#
# INPUT :1.問い合わせ対象ユーザ名一覧（テキスト）
# OUTPUT:1.存在するユーザ名一覧
#>

# INPUTファイルのユーザを問い合わせる
$array_exist_user = @() # 存在するユーザの格納用配列
foreach ($l in Get-Content $Args[0]) {
    net user $l /domain >> $null    
    $result = $?
    
    if ( $result )
    {
        $array_exist_user += $l;
    }
}

# 配列をファイルに書き込み
$array_exist_user >> output.txt

