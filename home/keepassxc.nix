{
  programs.keepassxc = {
    enable = true;
    settings = {
      General.ConfigVersion = 2;
      GUI = {
        ColorPasswords = true;
        ShowTrayIcon = false;
      };
      PasswordGenerator = {
        AdvancedMode = true;
        Braces = true;
        Dashes = true;
        ExcludeAlike = false;
        Length = 32;
        Logograms = true;
        Math = true;
        Punctuation = true;
        Quotes = true;
        UpperCase = true;
      };
      Security = {
        ClearClipboardTimeout = 30;
        ClearSearch = true;
        EnableCopyOnDoubleClick = true;
        IconDownloadFallback = true;
        LockDatabaseIdle = true;
        LockDatabaseIdleSeconds = 300;
      };
    };
  };
}
