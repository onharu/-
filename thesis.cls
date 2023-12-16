%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 卒論・修論用クラスファイル (thesis.cls)
%
%    v1.0: 2015/12/22 by 草刈
%          情報コースの卒論と修論用に作成
%          jsbook.cls を読み込み適宜修正する
%    v1.1: 2016/04/13 定理環境を追加 (by 草刈)
%
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{thesis}
  [2016/04/13 v1.1 thesis class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{jsbook}}
\ProcessOptions
\LoadClass[11pt,a4j,oneside,openany]{jsbook}

\RequirePackage{amsmath,amssymb}
\RequirePackage{theorem}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 見出し
\def\論文名#1{\def\@論文名{#1}}
\論文名{2015年度 卒業論文}

\long\def\所属#1{\def\@所属{#1}}
\所属{岐阜大学大学院工学研究科 応用情報学専攻 ○○研究室}

\def\学生番号#1{\def\@学生番号{#1}}
\学生番号{}

\def\氏名#1{\def\@氏名{#1}}
\氏名{岐阜太郎}

\def\指導教員#1{\def\@指導教員{#1}}
\指導教員{織田信長 教授}

\long\def\題目#1{\def\@題目{#1}}
\題目{情報科学や情報工学に関する研究}

\def\日付#1{\def\@日付{#1}}
\日付{2016年2月x日}

\renewcommand{\maketitle}{%
  \begin{titlepage}%
    \let\footnotesize\small%
    \let\footnoterule\relax%
    \let\footnote\thanks%
    \null\vfil%
    \begin{center}%
      \vskip 1em%
      {\LARGE\bfseries \@論文名 \par}%
      \vskip 3em%
      {\Huge\bfseries \@題目 \par}%
      \vfill%
      {\Large\bfseries \@所属 \par}%
      \vskip 2em%
      \ifx \@学生番号 \@empty%
        \begin{tabular}[t]{c}%
          {\LARGE\bfseries \@氏名}
        \end{tabular}\par%
      \else
        \begin{tabular}[t]{c}%
          {\Large\bfseries \@学生番号} \hskip 1zw {\LARGE\bfseries \@氏名}
        \end{tabular}\par%
      \fi
      \vskip 4em%
      {\Large\bfseries 指導教員 \hskip .5em \@指導教員 \par}%
      \vskip 1em%
      {\Large\bfseries \@日付 \par}%
      \vskip 3em%
    \end{center}%
    \par\@thanks\vfil\null%
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax%
  \global\let\maketitle\relax%
  \global\let\@thanks\@empty%
  \global\let\@author\@empty%
  \global\let\@date\@empty%
  \global\let\@title\@empty%
  \global\let\title\relax%
  \global\let\author\relax%
  \global\let\date\relax%
  \global\let\and\relax}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% レイアウト

\addtolength{\topmargin}{-11truemm}
\addtolength{\textheight}{15truemm}
\setlength{\textwidth}{\fullwidth}
\addtolength{\evensidemargin}{-\marginparwidth}

\renewcommand\mainmatter{%
  \clearpage
  \@mainmattertrue
  \pagenumbering{arabic}}

\def\@makechapterhead#1{%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \huge\headfont \@chapapp\thechapter\@chappos
        \hskip 1em
      \fi
    \fi
    \interlinepenalty\@M
    \huge \headfont #1\par\nobreak
    \vskip \Cvs}}

\def\@makeschapterhead#1{%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \huge \headfont #1\par\nobreak
    \vskip \Cvs}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 定理環境
\theorembodyfont{\normalfont}

\newtheorem{definition}{定義}[chapter]
\newtheorem{lemma}[definition]{補題}
\newtheorem{theorem}[definition]{定理}
\newtheorem{corollary}[definition]{系}
\newtheorem{proposition}[definition]{命題}
\newtheorem{conjecture}[definition]{予想}
\newtheorem{example}[definition]{例}
\newtheorem{proof}{証明:\hskip -2pt}
\renewcommand{\theproof}{}
\def\QED{\hspace*{\fill}$\square$}

%%%
%%% End of file `thesis.cls'