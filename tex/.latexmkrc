# 通常の LaTeX ドキュメントのビルドコマンド
$latex = 'uplatex %O -kanji=utf8 -no-guess-input-enc -synctex=1 -interaction=nonstopmode %S';
# pdfLaTeX のビルドコマンド
$pdflatex = 'pdflatex %O -synctex=1 -interaction=nonstopmode %S';
# LuaLaTeX のビルドコマンド
$lualatex = 'lualatex %O -synctex=1 -interaction=nonstopmode %S';
# XeLaTeX のビルドコマンド
$xelatex = 'xelatex %O -no-pdf -synctex=1 -shell-escape -interaction=nonstopmode %S';
# Biber, BibTeX のビルドコマンド
$biber = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$bibtex = 'upbibtex %O %B';
# makeindex のビルドコマンド
$makeindex = 'upmendex %O -o %D %S';
# dvipdf のビルドコマンド
$dvipdf = 'dvipdfmx %O -o %D %S';
# dvipd のビルドコマンド
$dvips = 'dvips %O -z -f %S | convbkmk -u > %D';
$ps2pdf = 'ps2pdf.exe %O %S %D';

# PDF の作成方法を指定するオプション
## $pdf_mode = 0; PDF を作成しない。
## $pdf_mode = 1; $pdflatex を利用して PDF を作成。
## $pdf_mode = 2; $ps2pdf を利用して .ps ファイルから PDF を作成。
## pdf_mode = 3; $dvipdf を利用して .dvi ファイルから PDF を作成。
## $pdf_mode = 4; $lualatex を利用して .dvi ファイルから PDF を作成。
## $pdf_mode = 5; xdvipdfmx を利用して .xdv ファイルから PDF を作成。
$pdf_mode = 4;

# PDF viewer の設定
$pdf_previewer = "start %S";  # "start %S": .pdf に関連付けられた既存のソフトウェアで表示する。

## Windows では SyncTeX(PDF をビューアーで開いたまま中身の更新が可能で更新がビューアーで反映される機能) が利用できる SumatraPDF 等が便利。
## ぜひ SyncTeX 機能のあるビューアーをインストールしよう。
## SumatraPDF: https://www.sumatrapdfreader.org/free-pdf-reader.html
## $pdf_previewer = 'SumatraPDF -reuse-instance';