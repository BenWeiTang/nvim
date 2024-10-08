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

        if require("project-env-config").GetIsUnrealProject() then
            local path = require("path")
            ls.add_snippets("cpp", {
                s({ trig="ufunction", desc="Snippet for UFUNCTION" }, fmt([[
                    UFUNCTION({finish})
                    {ret} {name}({params}){tail};
                    ]], {
                        ret     = i(1, "void"),
                        name    = i(2, "MyFunction"),
                        params  = i(3, ""),
                        tail    = c(4, { t(""), t(" const"), t(" override"), t(" final") }),
                        finish  = i(0, "")
                    })
                ),

                s({ trig="uproperty", desc="Snippet for UPROPERTY" }, fmt([[
                    UPROPERTY({finish})
                    {type} {name};
                    ]], {
                        type    = i(1, "Type"),
                        name    = i(2, "Identifier"),
                        finish  = i(0, "")
                    })
                ),

                s({ trig="ustruct", desc="Snippet for UStruct" }, fmt([[
                    USTRUCT({finish})
                    struct {API} F{name}
                    {{
                        GENERATED_USTRUCT_BODY()
                    }};
                    ]], {
                        name    = i(1, "Identifier"),
                        API     = i(2, "API_NAME"),
                        finish  = i(0, "")
                    })
                ),

                s({ trig="uobject", desc="Snippet for UObject class" }, fmt([[
                    #pragma once

                    #include "CoreMinimal.h"
                    #include "{class_name}.generated.h"

                    UCLASS()
                    class MY_API U{class_name} : public UObject
                    {{
                        GENERATED_BODY()

                    public:
                        {finish}
                    }};
                    ]], {
                        class_name = f(function()
                            return vim.split(path.GetCurrentFileName(), ".", { plain=true })[1]
                        end),
                        finish = i(0, "")
                    })
                ),

                s({ trig="uenum", desc="Snippet for UEnum"}, fmt([[
                    UENUM(BlueprintType)
                    enum class E{enum_name} : uint8
                    {{
                        {finish}
                    }};
                    ]], {
                        enum_name = i(1, ""),
                        finish = i(0, ""),
                    })
                ),

                -- UFUNCTION execution accessibility
                s("blueprintcallable",              { t("BlueprintCallable") }),
                s("blueprintpure",                  { t("BlueprintPure") }),
                s("blueprintnativeevent",           { t("BlueprintNativeEvent") }),
                s("blueprintimplementableevent",    { t("BlueprintImplementableEvent") }),

                -- UPROPERTY Blueprint Graph accessibility
                s("blueprintreadonly",      { t("BlueprintReadOnly") }),
                s("blueprintreadwrite",     { t("BlueprintReadWrite") }),
                s("blueprintassignable",    { t("BlueprintAssignable") }),

                -- UPROPERTY Details panel visibility
                s("visibleanywhere",        { t("VisibleAnywhere") }),
                s("visibledefaultsonly",    { t("VisibleDefaultsOnly") }),
                s("visibleinstanceonly",    { t("VisibleInstanceOnly") }),

                -- UPROPERTY Details panel editability
                s("editanywhere",       { t("EditAnywhere") }),
                s("editdefaultsonly",   { t("EditDefaultsOnly") }),
                s("editinstanceonly",   { t("EditInstanceOnly") }),

                -- UCLASS and USTRUCT Blueprint-ability
                s({ trig="blueprinttype", desc="Exposes this class as a type that can be used for variables in Blueprints." }, { t("BlueprintType") }),
                s({ trig="blueprintable", desc="Exposes this class as an acceptable base class for creating Blueprints." }, { t("Blueprintable") }),

                -- Miscellaneous
                s("category",           { t("Category=\""), i(1, "Category"), t("\"") }),
                s("meta",               { t("meta=("), i(1, ""), t(")") }),
                s("allowprivateaccess", { t("AllowPrivateAccess=true") }),
                s("tobjptr",            { t("TObjectPtr<"), i(1, ""), t(">"), i(0, "") }),
                s("tsharedptr",         { t("TSharedPtr<"), i(1, ""), t(">"), i(0, "") }),
                s("cast",               { t("Cast<"), i(1, "TO"), t(", "), i(2, "FROM"), t(">("), i(3, ""), t(")"), i(0, "") }),
                s("tooltip",            { t("ToolTip=\"") , i(1, ""), t("\"") }),
                s("gcsfrontendapi",     { t("GCS_FRONTEND_API") }), -- project-based, change later
                s("uelog",              { t("UE_LOG("), i(1, ""), t(", Log, TEXT(\""), i(2, ""), t("\"));")}),
            })
        end
    end,
}
