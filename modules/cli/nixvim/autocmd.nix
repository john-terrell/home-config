{
    autoCmd = [
    {
        command = "let &scrolloff = winheight(0) / 4";
        event = [
            "VimEnter"
                "WinEnter"
        ];
    }
    ];
}

