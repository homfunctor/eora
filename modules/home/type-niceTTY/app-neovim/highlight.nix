{config, ...}: {
  programs.nixvim.highlightOverride = with config.lib.stylix.colors.withHashtag; {
    Boolean.fg = "#5A6B9C";
    Comment = {
      fg = "#8B7AA3";
      italic = true;
    };
    CmpDocumentation.bg = "none";
    CmpDocumentationBorder.bg = "none";
    CmpItemAbbr.bg = "none";
    CursorLineNr.bg = "none";
    DiagnosticHint.bg = "none";
    DiagnosticInfo.bg = "none";
    EndOfBuffer.bg = "none";
    FloatBorder.bg = "none";
    Keyword.fg = "#7ABF9E";
    LineNr.bg = "none";
    Normal.bg = "none";
    NormalFloat.bg = "none";
    NotifyBackground.bg = "none";
    Number.fg = "#4A6B8A";
    Pmenu.bg = "none";
    SignColumn.bg = "none";
    SnacksIndent = {
      bg = "none";
      fg = base03;
    };
    SnacksIndentScope = {
      bg = "none";
      fg = base08;
    };
    StatusLine.bg = "none";
    String.italic = true;
    TabLine.bg = "none";
    TreesitterContext.bg = "none";
    TroubleNormal.bg = "none";
    TroubleNormalNC.bg = "none";
    TSBoolean.link = "Boolean";
    TSComment.link = "Comment";
    TSKeyword.link = "Keyword";
    TSNumber.link = "Number";
    WhichKeyNormal.bg = "none";
    WinBar.bg = "none";
    WinBarNC.bg = "none";
  };
}
