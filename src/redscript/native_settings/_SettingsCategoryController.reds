@wrapMethod(SettingsCategoryController)
public final func Setup(label: CName) -> Void {
    if NativeSettings.GetInstance().fromMods {
        let labelString: String = GetLocalizedTextByKey(label);
        if StrLen(labelString) == 0 {
            labelString = ToString(label);
        };
        inkTextRef.SetText(this.m_label, labelString);
    } else {
        wrappedMethod(label);
    }
}