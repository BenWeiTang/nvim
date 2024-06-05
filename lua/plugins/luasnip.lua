return {
    "L3MON4D3/LuaSnip",
    config = function()
        local ls = require("luasnip")
        local s = ls.snippet
        local sn = ls.snippet_node
        local t = ls.text_node
        local i = ls.insert_node
        local f = ls.function_node
        local c = ls.choice_node
        local d = ls.dynamic_node
        local r = ls.restore_node
        local fmt = require("luasnip.extras.fmt").fmt
        local types = require("luasnip.util.types")
        ls.setup({
            history = true,
            enable_autosnippets = false,
            ext_opts = {
                [types.choiceNode] = {
                    active = {
                        virt_text = { { "<-", "Normal" } },
                    }
                }
            },
        })

        if require("project-env-config").GetIsUnrealProject then
            ls.add_snippets("all", {
                s("ufn", fmt([[
            UFUNCTION({finish})
            {ret} {name}({params}){tail};
            ]], {
                    ret = i(1, "void"),
                    name = i(2, "MyFunction"),
                    params = i(3, ""),
                    tail = c(4, { t(""), t(" const"), t(" override"), t(" final") }),
                    finish = i(0, "")
                })),

                s("ubf",
                    { c(1,
                        { t("BlueprintCallable"), t("BlueprintPure"), t("BlueprintNativeEvent"), t(
                        "BlueprintImplementableEvent") }) }),

                s("upr", fmt([[
            UPROPERTY({finish})
            {type} {name};
            ]], {
                    type = i(1, "Type"),
                    name = i(2, "Identifier"),
                    finish = i(0, "")
                })),

                s("uvis",
                    { c(1,
                        { t("VisibleAnywhere"), t("VisibleDefaultsOnly"), t("VisibleInstanceOnly"), t("EditAnywhere"), t(
                        "EditDefaultsOnly"), t("EditInstanceOnly"), t("") }) }),
                s("ubp", { c(1, { t("BlueprintReadOnly"), t("BlueprintReadWrite"), t("BlueprintAssignable"), t("") }) }),
                s("category", { t("Category = \""), i(1, "Category"), t("\"") }),
                s("meta", { t("meta = ("), i(1, ""), t(")") }),
                s("AllowPrivateAccess", { t("AllowPrivateAccess=true") }),
            })
        end
    end,
}
