<%@ Control Language="C#" AutoEventWireup="true" CodeFile="performance.ascx.cs" Inherits="s_performance" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>
<div style="overflow:hidden">
<telerik:RadChart ID="RadChart1" runat="server" DefaultType="Line" 
    Height="280px" Skin="Vista">
    <Appearance Corners="Round, Round, Round, Round, 7">
        <FillStyle FillType="ComplexGradient">
            <FillSettings>
                <ComplexGradient>
                    <telerik:GradientElement Color="243, 253, 255" />
                    <telerik:GradientElement Color="White" Position="0.5" />
                    <telerik:GradientElement Color="243, 253, 255" Position="1" />
                </ComplexGradient>
            </FillSettings>
        </FillStyle>
        <Border Color="212, 221, 222" />
    </Appearance>
    <Legend>
        <Appearance Dimensions-Margins="1px, 1%, 10%, 1px">
            <ItemTextAppearance TextProperties-Color="86, 88, 89">
            </ItemTextAppearance>
            <ItemMarkerAppearance Figure="Rectangle">
            </ItemMarkerAppearance>
            <FillStyle MainColor="">
            </FillStyle>
            <Border Color="" />
        </Appearance>
        <TextBlock>
            <Appearance Position-AlignedPosition="Top" TextProperties-Color="86, 88, 89">
            </Appearance>
        </TextBlock>
    </Legend>
    <PlotArea>
        <EmptySeriesMessage Visible="True">
            <Appearance Visible="True">
            </Appearance>
        </EmptySeriesMessage>
        <XAxis>
            <Appearance Color="134, 134, 134" MajorTick-Color="134, 134, 134">
                <MajorGridLines Color="196, 196, 196" Width="0" />
                <TextAppearance TextProperties-Color="89, 89, 89">
                </TextAppearance>
            </Appearance>
            <AxisLabel>
                <Appearance Dimensions-Paddings="1px, 1px, 10%, 1px">
                </Appearance>
                <TextBlock>
                    <Appearance TextProperties-Color="51, 51, 51">
                    </Appearance>
                </TextBlock>
            </AxisLabel>
        </XAxis>
        <YAxis>
            <Appearance Color="134, 134, 134" MajorTick-Color="196, 196, 196" 
                MinorTick-Color="196, 196, 196">
                <MajorGridLines Color="196, 196, 196" />
                <MinorGridLines Color="196, 196, 196" Width="0" />
                <TextAppearance TextProperties-Color="89, 89, 89">
                </TextAppearance>
            </Appearance>
            <AxisLabel>
                <TextBlock>
                    <Appearance TextProperties-Color="220, 158, 119">
                    </Appearance>
                </TextBlock>
            </AxisLabel>
        </YAxis>
        <Appearance Dimensions-Margins="19%, 90px, 12%, 9%">
            <FillStyle MainColor="Transparent" SecondColor="Transparent">
            </FillStyle>
            <Border Color="WhiteSmoke" />
        </Appearance>
    </PlotArea>
    <ChartTitle>
        <Appearance Dimensions-Margins="3%, 10px, 14px, 6%">
            <FillStyle MainColor="">
            </FillStyle>
        </Appearance>
        <TextBlock Text="">
            <Appearance TextProperties-Color="86, 88, 89" 
                TextProperties-Font="Verdana, 22px">
            </Appearance>
        </TextBlock>
    </ChartTitle>
</telerik:RadChart>
<asp:LinqDataSource ID="LinqDataSource1" runat="server" 
    ContextTypeName="Datbase_ClassesDataContext" EntityTypeName="" 
    Select="new (tenth, Inter, Eamcet_Rank, Sem1, Sem2, Sem3, Sem4, Sem5, Sem6, Sem7, Sem8)" 
    TableName="Students" Where="Student_ID == @Student_ID">
    <WhereParameters>
        <asp:SessionParameter DefaultValue="UserLogin" Name="Student_ID" 
            SessionField="UserLogin" Type="String" />
    </WhereParameters>
</asp:LinqDataSource>
</div>

