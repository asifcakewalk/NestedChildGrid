<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>


    <script type="text/javascript">
        var template = '<span style="color:{0};">{1}</span>';

        var change = function (value) {
            return String.format(template, (value > 0) ? "green" : "red", value);
        };

        var pctChange = function (value) {
            return String.format(template, (value > 0) ? "green" : "red", value + "%");
        };
    </script>


</head>
<body>
    <form id="form1" runat="server">
        <div>

            <ext:ResourceManager ID="ResourceManager1" runat="server" CleanResourceUrl="true" DirectMethodNamespace="DM" Namespace="app">
            </ext:ResourceManager>

            <ext:Viewport runat="server">
                <Items>


                    <ext:GridPanel
                        ID="GridPanel1"
                        runat="server"
                        Title="Array Grid"
                        Width="700" AutoHeight="true">
                        <Store>
                            <ext:Store ID="Store1" runat="server"  PageSize="10">
                                <Model>
                                    <ext:Model runat="server">
                                        <Fields>
                                            <ext:ModelField Name="company" />
                                            <ext:ModelField Name="price" Type="Float" />
                                            <ext:ModelField Name="change" Type="Float" />
                                            <ext:ModelField Name="pctChange" Type="Float" />
                                            <ext:ModelField Name="lastChange" Type="Date" DateFormat="M/d hh:mmtt" />
                                        </Fields>

                                    </ext:Model>

                                </Model>

                            </ext:Store>
                        </Store>


                        <ColumnModel runat="server">
                            <Columns>


                                <ext:Column ID="Company" Header="Company" DataIndex="company" runat="server" />

                                <ext:Column Header="Price" DataIndex="price" runat="server">
                                    <Renderer Format="UsMoney" />
                                </ext:Column>
                                <ext:Column ColumnID="Change" Header="Change" DataIndex="change" runat="server">
                                    <Renderer Fn="change" />
                                </ext:Column>
                                <ext:Column Header="Change" DataIndex="pctChange" runat="server">
                                    <Renderer Fn="pctChange" />
                                </ext:Column>
                                <ext:DateColumn Header="Last Updated" DataIndex="lastChange" runat="server" />
                            </Columns>
                        </ColumnModel>

                        <SelectionModel>
                            <ext:CheckboxSelectionModel runat="server"></ext:CheckboxSelectionModel>
                        </SelectionModel>

                        <View>
                            <ext:GridView runat="server" StripeRows="true" />
                        </View>

                        <Plugins>

                            <ext:RowExpander ID="gridResultsExpander" Visible="true" runat="server" ExpandOnDblClick="false">

                                <Component>

                                    <ext:GridPanel
                                        ID="gridChild1"
                                        runat="server"
                                        Width="500" AutoHeight="true" EnableColumnHide="false">
                                        <Store>
                                            <ext:Store ID="Store2" runat="server"  PageSize="10">
                                                <Model>
                                                    <ext:Model runat="server">
                                                        <Fields>
                                                            <ext:ModelField Name="company" />
                                                            <ext:ModelField Name="price" Type="Float" />
                                                            <ext:ModelField Name="change" Type="Float" />

                                                        </Fields>
                                                    </ext:Model>

                                                </Model>

                                            </ext:Store>
                                        </Store>
                                        <ColumnModel runat="server">
                                            <Columns>
                                                <ext:Column ColumnID="Company" Header="Company" DataIndex="company" runat="server" />
                                                <ext:Column Header="Price" DataIndex="price" runat="server">
                                                    <Renderer Format="UsMoney" />
                                                </ext:Column>
                                            </Columns>
                                        </ColumnModel>

                                        <SelectionModel>
                                            <ext:CheckboxSelectionModel runat="server" XCheckOnly="true" PruneRemoved="false" ShowHeaderCheckbox="false" CheckOnly="true">
                                            </ext:CheckboxSelectionModel>
                                        </SelectionModel>


                                    </ext:GridPanel>

                                </Component>
                            </ext:RowExpander>

                        </Plugins>
                    </ext:GridPanel>

                </Items>

            </ext:Viewport>


        </div>
    </form>
</body>
</html>
