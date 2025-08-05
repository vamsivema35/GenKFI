<%@ Page Title="" Language="C#" MasterPageFile="~/GenKFI.Master" AutoEventWireup="true" CodeBehind="editJSauto.aspx.cs" Inherits="GenKFI.utils.formBuilder.editJSauto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
	<style type="text/css">
		.myne {
			border-style: solid;
			border-width: 1px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyHolder" runat="server">
	<table class="myne" style="width: 35%;">
		<tr>
			<th style="width: 33%;">Functions</th>
			<th colspan="2" style="width: 66%;">Details</th>
		</tr>
		<tr>
			<td rowspan="6">
				<asp:ListBox runat="server" ID="functionLST" Width="100%" Height="100%" AutoPostBack="true" OnSelectedIndexChanged="OnSelectedIndexChanged_functionLST" ></asp:ListBox>
			</td>
			<td style="text-align:right;">
				Name/Desc
			</td>
			<td style="text-align:left;">
				<asp:TextBox runat ="server" Width="100%" ID="funcNameTXT"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td colspan="2"><hr /></td>
		</tr>
		<tr>
			<td>
				Input Value 1 Placeholder
			</td>
			<td>
				Input Value 2 Placeholder
			</td>
		</tr>
		<tr>
			<td>
				<asp:TextBox runat="server" ID="input1NameTXT" Width="100%"></asp:TextBox>
			</td>
			<td>
				<asp:TextBox runat="server" ID="input2NameTXT" Width="100%"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td>
				Input Name 1 Placeholder
			</td>
			<td>
				Input Name 2 Placeholder
			</td>
		</tr>
		<tr>
			<td>
				<asp:TextBox runat="server" ID="name1NameTXT" Width="100%"></asp:TextBox>
			</td>
			<td>
				<asp:TextBox runat="server" ID="name2NameTXT" Width="100%"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				Function Listing
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<asp:TextBox runat="server" ID="funcListTXT" Width="100%" Height="180px" TextMode="MultiLine"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td>
				<asp:Button runat="server" ID="addBTN" Width="100%" Text="Add Function" OnClick="OnClick_addBTN" />
			</td>
			<td>
				<asp:Button runat="server" ID="saveBTN" Width="100%" Text="Save Function" OnClick="OnClick_saveBTN" />
			</td>
			<td>
				<asp:Button runat="server" ID="remBTN" Width="100%" Text="Remove Function" OnClick="OnClick_remBTN" />
			</td>
		</tr>
	</table>
	<div style="text-align: center;"><a href="../../Default.aspx">Done</a></div>
	<div style="width: 75%; margin: auto;">
		<h1>Instructions</h1>
		<br />
		Use this form to define the desired JavaScript functions to be used for auto-completing 
		fields on the KFI forms. NOTE: Removing a function will remove it from all controls using
		that function.
		<h3>Definition</h3>
		Give the function a name. Every function will take two parameters. Give these parameters 
		names in the "Placeholder" boxes. Enter the body of the function in the "Function Listing" 
		box, using the names you entered. Parameters will be passed to the function as strings, so be
		sure to parse them to the types your function will require.
		<br /><br />
		NOTE: Be sure to use parameter names that won't appear in the function. For example, don't
		use the letter 'a' for a parameter name when using 'parseInt(a)' in the function. If you do
		it will replace all the letter with the value of 'a', i.e. if 'a' = 7, then the function becomes
		'p<strong>7</strong>rseInt(<strong>7</strong>)', which clearly will not run. A better solution is to prefix
		all parameter names with '@'.
		<h3>Example</h3>
		To define an integer summation function, enter SUM in the name field, name the two parameters @X and @Y, 
		and enter the following in the listing box: parseInt(@X) + parseInt(@Y). This is the equivalent of the function 
		SUM( X, Y ){ return ( parseInt(X) + parseInt(Y) ); }.
		<h3>Usage</h3>
		When building a KFI form, you will have the option to define a field as an auto-complete 
		field. Simple select the auto-complete function you wish to use, and define two other fields 
		to use as inputs, corresponding to the input parameters here. 
		<h3>More than 2 inputs</h3>
		To use more than two input parameters, simply chain the functions together. For example, when a sum of three
		numbers is required, first create a function and give it the first two inputs and the SUM function. Then
		append the SUM function again, and give it the previous row along with the third input. The program will 
		string the functions together as follows SUM( SUM( input1, input2 ), input3 ), and put the resulting 
		value in the defined field.
	</div>
</asp:Content>
