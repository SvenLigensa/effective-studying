% ------------------------------------------------------------- %
% Custom template for ERCIS presentations                       %
% Author: Denis Martins (denis.martins@ercis.de)                %
% ------------------------------------------------------------- 

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ercisbeamer}[2021/03/05 ERCIS Beamer LaTeX class]

% Widescreen presentation
\LoadClass[aspectratio=169]{beamer}

% Required packages
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{xcolor}
\RequirePackage{pgf}
\RequirePackage{hyperref}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage{ifmtarg}
\RequirePackage{graphicx}
\RequirePackage{multirow}
\RequirePackage{tabularx}
\RequirePackage{caption}
\RequirePackage{textpos}
\captionsetup[figure]{labelformat=empty}
\RequirePackage[
    natbib=true,
    style=alphabetic,
    maxcitenames=3,
    giveninits=false,
    backend=biber,
    hyperref=true,
    url=true]{biblatex}
\bibliography{library.bib}
\nocite{brown14makeitstick}

\mode<presentation>

% Use Boadilla as base theme
\usetheme{Boadilla}


\definecolor{ercisblack}{RGB}{0,0,0}
\definecolor{ercisgrey}{RGB}{94,94,93}
\definecolor{ercisred}{RGB}{133,35,57}
\definecolor{ercislightred}{RGB}{200,156,166}
\definecolor{pantoneblack7}{RGB}{62,62,59}

\definecolor{mygrey}{RGB}{170,170,170}
\definecolor{mygreen}{RGB}{34,153,84}
\definecolor{myred}{RGB}{231,76,60}
\definecolor{todo}{RGB}{178,36,27}
\newcommand{\red}[1]{\textcolor{ercisred}{#1}}
\newcommand{\lightred}[1]{\textcolor{ercislightred}{#1}}
\newcommand{\grey}[1]{\textcolor{mygrey}{#1}}
\newcommand{\positive}[1]{\textcolor{mygreen}{#1}}
\newcommand{\negative}[1]{\textcolor{myred}{#1}}
\newcommand{\todo}[1]{\colorbox{todo}{\textcolor{white}{TODO: #1}}}

\setbeamercolor{wwu logo}{fg=pantoneblack7}
\setbeamercolor{title page wwu logo}{parent=wwu logo}
\setbeamercolor{title}{fg=ercisred}
\setbeamercolor{frametitle}{fg=ercisred}
\setbeamercolor{section}{fg=ercisred}
\setbeamercolor{author}{bg=white, fg=ercisgrey}
\setbeamertemplate{caption}[default]
\setbeamercolor*{caption name}{fg=ercisred}
\setbeamertemplate{section in toc}[sections numbered]
\setbeamercolor*{section in toc}{fg=ercisred}
\setbeamertemplate{subsection in toc}[square]
\setbeamercolor*{subsection number projected}{bg=ercisred}
\setbeamercolor*{item}{fg=ercisred}
\usefonttheme[onlymath]{serif} 
\setbeamertemplate{navigation symbols}{}
\usecolortheme[named=ercisgrey]{structure}
\hypersetup{
    colorlinks=true,
    linkcolor=ercisred,
    urlcolor=ercisred,
    citecolor=ercisred,
}

% Custom title page
\defbeamertemplate*{title page}{customized}[1][]{%
    \vfill
    % Logos only on the first slide
    \ifnum\insertframenumber=1
    \begin{tikzpicture}[remember picture,overlay]
        \node[at=(current page.north east), anchor=north east, inner sep=1cm, yshift=-1cm] (logo1) {\includegraphics[width=2.5cm]{00_resources/uni_muenster_logo.png}};
        \node[at=(logo1.south), anchor=north] (logo2) {\includegraphics[width=2.5cm]{00_resources/ercis_logo.png}};
    \end{tikzpicture}
    \fi
    %        
    \usebeamerfont{title}\usebeamercolor[fg]{title} \Huge \inserttitle\par
    \medskip
    \usebeamerfont{subtitle}\usebeamercolor[fg]{subtitle} \large \insertsubtitle\par
    \bigskip
    %
    \usebeamerfont{author}\usebeamercolor[black]{}\insertauthor\par
    \usebeamerfont{institute}\usebeamercolor[black]{}\insertinstitute\par
    \bigskip
    \usebeamerfont{date}\usebeamercolor[black]{}\insertdate\par
    %
    \bigskip
    \usebeamercolor[fg]{titlegraphic}\inserttitlegraphic
}

% Custom footline
\defbeamertemplate*{footline}{myfootline} {
    \ifnum \insertpagenumber=1
        \leavevmode%
        \hbox{%
            \begin{beamercolorbox}[wd=\paperwidth,ht=.80ex,dp=1ex,center]{}%
            % empty environment to raise height
            \end{beamercolorbox}
        }%
        \vskip0pt%
    \else
        \leavevmode%
        \hbox{%
            \begin{tikzpicture}[overlay, remember picture]
                % Semi-transparent white fill
                \fill[white, fill opacity=0.5] ($(current page.south west)+(0,0)$) rectangle ($(current page.south east)+(0,4.25ex)$);
                % Line at top
                \draw[color=ercisred, line width=0.15mm] ($(current page.south west)+(0,4.25ex)$) -- ($(current page.south east)+(0,4.25ex)$);
                % Left-aligned content
                \node[anchor=south west,
                      inner sep=0pt, 
                      minimum height=1.25ex + 3ex, 
                      text=ercisgrey, text opacity=1] 
                      at ($(current page.south west)+(0.2,0)$)
                      {\textbf{\insertshorttitle}  ~|~ \insertshortauthor ~|~ ERCIS};
                % Right-aligned content
                \node[anchor=south east,
                      inner sep=0pt, 
                      minimum height=1.25ex + 3ex, 
                      text=ercisgrey, text opacity=1] 
                      at ($(current page.south east)-(0.2,0)$)
                      {\insertshortdate{}\hspace*{2em}\insertframenumber{}};
            \end{tikzpicture}
        }%
        \vskip0pt%
    \fi
}

% Custom command to enclose final slide
\newcommand{\thankyou}[3]{
    \begin{frame}
        \begin{center}
            \Huge \usebeamercolor[fg]{title}#1\\
            \bigskip \bigskip
            \large \usebeamerfont{author}\usebeamercolor[black]{}\insertauthor\\
            \medskip
            #2 
            \medskip
            #3
        \end{center}
    \end{frame}
}

% Command to display sources 
\newcommand{\sources}{
    \begin{frame}{Sources}
        \red{[Images]} \quad AI-generated with the help of \red{ChatGPT} \grey{(GPT-4 \& DALL·E 3)}
        % \begin{itemize}
        %     \item[Images] 
        % \end{itemize}
        \printbibliography
    \end{frame}
}

% Command to set background image of a slide
\newcommand{\setbgimage}[1]{%
    \ifstrempty{#1}{%
        \setbeamertemplate{background}{}%
    }{%
        \setbeamertemplate{background}{%
            \begin{tikzpicture}[remember picture,overlay]
                \node[at=(current page.center), inner sep=0pt] {
                    \includegraphics[width=\paperwidth,height=\paperheight]{#1}
                };
            \end{tikzpicture}
        }%
    }%
}

% Environment for text on slides with background image
\newenvironment{tbox}{
    \begin{tikzpicture}
        \node[text width=\textwidth, 
              fill=white, 
              fill opacity=0.8, 
              text opacity=1]
    \bgroup}{\egroup;
    \end{tikzpicture}
}

% \newcommand{\citeBlock}[1]{%
%     \begin{textblock*}{150pt}(200pt, 244pt)
%         \tiny #1
%     \end{textblock*}
% }
