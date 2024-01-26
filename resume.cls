%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 卒論レジュメ用クラスファイル (resume.cls)
%
%    v1.0: 2015/12/22 by KUSAKARI Keiichirou
%          情報コースの卒論(レジュメ版)用に作成
%          jsarticle.cls を読み込み適宜修正する
%    v1.1: 2016/05/09 by KUSAKARI Keiichirou
%    v1.1: 2017/05/24 by KUSAKARI Keiichirou
%          名前の変更：bthesis.cls -> resume.cls
%
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{resume}
  [2016/05/09 v1.1 bthesis class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{jsarticle}}
\ProcessOptions
\LoadClass[twocolumn]{jsarticle}

\RequirePackage{amsmath,amssymb}
\RequirePackage{theorem}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 見出し
\def\所属#1{\def\@所属{#1}}
\所属{岐阜大学 工学部 応用情報学科}

\def\研究室#1{\def\@研究室{#1}}
\研究室{○○研究室}

\def\氏名#1{\def\@氏名{#1}}
\氏名{岐阜太郎}

\long\def\題目#1{\def\@題目{#1}}
\題目{情報工学に関する研究}

\renewcommand\@maketitle{%
  \begin{center}%
    \let\footnote\thanks
    \vspace{-8mm}
    \begin{flushright}{\small{\color{red}\fbox{再配布禁止}}}\end{flushright}
    {\LARGE\bfseries \@題目 \par}%
    \vskip 1em%
    {\large\bfseries
      \lineskip .5em%
      \begin{tabular}[t]{ccc}%
        \@所属 & \@研究室 & \@氏名%
      \end{tabular}\par}%
  \end{center}%
  \par\vskip 1.5em}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% レイアウト

\setlength{\parskip}{0pt}
\setlength{\topsep}{3pt}
\setlength{\partopsep}{3pt}
%\setlength{\baselineskip}{0pt}        %行間スペース．何故か有効にならない．
%\renewcommand{\baselinestretch}{0.95} %行間スペース．最後の手段です．
%\setlength{\parindent}{0pt}           %段落冒頭の字下げなし
\pagestyle{empty}                     %ページ番号なし

%縦方向
\setlength{\textheight}{\paperheight}  % 高さを本文領域に合わせる
\setlength{\topmargin}{-7.4truemm}     % 上の余白を18mm(=1inch(25.4mm)-7.4mm)に
                                         % ↑見出しの上余白として2mm(?)追加される
\addtolength{\topmargin}{-\headheight} % ヘッダの分の補正(上余白)
\addtolength{\topmargin}{-\headsep}    % ヘッダの分の補正(上余白)
\addtolength{\textheight}{-30truemm}   % 下の余白を20mm(35=15+20)に
\addtolength{\textheight}{-3truemm}      % ↑何故か計算通りにならないので補正
\setlength{\topskip}{0truemm}          % 本文1行目直前の余白を削除

%横方向
\setlength{\textwidth}{\paperwidth}      % 幅を本文領域に合わせる
\setlength{\oddsidemargin}{-10.4truemm}  % 左の余白を15mm(=1inch(25.4mm)-10.4mm)に
\setlength{\evensidemargin}{-10.4truemm} % 左の余白を15mm(=1inch(25.4mm)-10.4mm)に
\addtolength{\textwidth}{-30truemm}      % 右の余白を15mm(30=15+15)に
\setlength{\columnsep}{8truemm}          % 真ん中隙間の横幅

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% section環境関連

\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa<\z@
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}% 目次にフルネームを載せるなら #8
  \else
    \begingroup
      \interlinepenalty \@M % 下から移動
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
        #8\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}% 目次にフルネームを載せるならここは #8
  \fi
  \@xsect{#5}
  {\ifnum #2 < 2 \leavevmode\par\noindent \fi}} %\section環境では見出しの後に改行を

\def\@seccntformat#1{\csname the#1\endcsname.\hskip.3em}

\renewcommand{\section}{%
  \@startsection{section}{1}{\z@}%
  {0em}{-1em}{\normalfont\headfont\raggedright}}

\renewcommand{\subsection}{%
  \@startsection{subsection}{2}{\z@}%
  {0em}{-1em}{\normalfont\headfont}}

%\renewcommand\refname{\vskip-1em\par\noindent{参考文献}}
\renewcommand\@openbib@code{%
  \setlength{\labelwidth}{1.6em}%
  \setlength{\leftmargin}{\labelwidth}%
  \setlength{\topsep}{0pt}%
  \setlength{\parskip}{0pt}%
  \setlength{\parsep}{0pt}%
  \setlength{\itemsep}{0pt}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 定理環境
\theorembodyfont{\normalfont}
\setlength{\theorempreskipamount}{.5em}
\setlength{\theorempostskipamount}{.5em}

\newtheorem{definition}{定義}[section]
\newtheorem{lemma}[definition]{補題}
\newtheorem{theorem}[definition]{定理}
\newtheorem{corollary}[definition]{系}
\newtheorem{proposition}[definition]{命題}
\newtheorem{conjecture}[definition]{予想}
\newtheorem{example}[definition]{例}
\newtheorem{proof}{証明:\hskip -2pt}
\renewcommand{\theproof}{}
\def\QED{\hspace*{\fill}$\square$}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% リスト環境

\def\@listsize{%
  %\setlength{\parskip}{0pt}%
  \setlength{\itemindent}{0zw}%
  \setlength{\leftmargin}{2zw}%
  \setlength{\rightmargin}{0zw}%
  \setlength{\labelsep}{.4zw}%
  \setlength{\labelwidth}{3zw}%
  \setlength{\itemsep}{.2em}%
  \setlength{\topsep}{3pt}%
  \setlength{\parsep}{-2pt}%
  \setlength{\partopsep}{0pt}%
  \setlength{\listparindent}{0zw}}

%%% itemize
\renewenvironment{itemize}{%
  \ifnum \@itemdepth >\thr@@\@toodeep\else%
    \advance\@itemdepth\@ne%
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter%
    \list{\csname\@itemitem\endcsname}{%
       \@listsize%
       \def\makelabel##1{\hss\llap{##1}}}%
  \fi}{\endlist}

%%% enumerate
\renewenvironment{enumerate}{%
  \ifnum \@enumdepth >\thr@@\@toodeep\else%
    \advance\@enumdepth\@ne%
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
    \expandafter%
    \list{\csname label\@enumctr\endcsname}{%
      \usecounter\@enumctr%
      \@listsize%
      \addtolength{\leftmargin}{.5zw}%
      \def\makelabel##1{\hss\llap{##1}}}%
  \fi}{\endlist}

%%% description
\renewenvironment{description}{%
  \list{}{%
    \@listsize%
    \labelwidth\z@ \itemindent-\leftmargin%
    \addtolength{\labelwidth}{-1zw}%
    \let\makelabel\descriptionlabel}
  }{\endlist}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 他の環境

%figure環境
%\setlength{\floatsep}{0pt}
%\setlength{\textfloatsep}{6pt}
%\setlength{\intextsep}{0pt}
%\setlength{\dblfloatsep}{0pt}
%\setlength{\dbltextfloatsep}{6pt}
%\setlength{\abovecaptionskip}{-4pt}
%\setlength{\belowcaptionskip}{-8pt}
%\let\orgfigure\figure
%\let\orgendfigure\endfigure
%\def\figure{\vspace*{-8pt}\orgfigure}
%\def\endfigure{\orgendfigure\vspace*{-12pt}}

%display環境
\def\narrowbaselines{%
   \narrowbaselinestrue
   \skip0=\abovedisplayskip
   \skip2=\abovedisplayshortskip
   \skip4=\belowdisplayskip
   \skip6=\belowdisplayshortskip
   \@currsize \selectfont
   \abovedisplayskip=6pt\relax
   \abovedisplayshortskip=6pt\relax
   \belowdisplayskip=6pt\relax
   \belowdisplayshortskip=6pt\relax}

%center環境
%\let\orgcenter\center
%\let\orgendcenter\endcenter
%\def\center{\vspace*{3pt}\orgcenter}
%\def\endcenter{\orgendcenter\vspace*{3pt}}

%verbatim環境
\newlength{\verbbaselineskip}
\setlength{\verbbaselineskip}{12pt}

\let\orgverbatim\verbatim
\let\orgendverbatim\endverbatim
\def\verbatim{\bgroup \baselineskip=\verbbaselineskip \orgverbatim}
\def\endverbatim{\orgendverbatim \egroup}

%%%
%%% End of file `resume.cls'