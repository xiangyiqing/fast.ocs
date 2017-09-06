<%@ page language="java" pageEncoding="utf-8" %>
<!-- Advanced Search -->
<div class="modal fade" id="advancedsearch" tabindex="-1" role="dialog" aria-labelledby="searchbox">
    <div class="modal-dialog" role="document" style="min-width: 800px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="searchbox">Display Filter</h4>
            </div>
            <div class="modal-body searchbox">
                <table class="table table-striped table-hover" id="search_table">
                    <tr>
                        <th>And/Or</th>
                        <th>Type</th>
                        <th>Operation</th>
                        <th>Condition</th>
                        <th>&nbsp;</th>
                    </tr>
                    <tr id="srch_row" style="display: none">
                        <td>
                            <div class="andorbtn">
                                <select class="" data-width="70px" name="andor">
                                    <option value="and">And</option>
                                    <option value="or">Or</option>
                                </select>
                            </div>
                        </td>
                        <td>
                            <select data-width="120px" name="type">
                                <optgroup label="Proposal">
                                    <option value="pid">Proposal Id</option>
                                    <option value="ptit">Proposal Title</option>
                                    <option value="ppor">Proposer</option>
                                    <option value="prate">Rate</option>
                                </optgroup>
                                <optgroup label="MSB">
                                    <option value="mid">MSB Id</option>
                                    <option value="mtit">MSB Title</option>
                                    <option value="mrc">Repeat Counts</option>
                                    <option value="mws">Wind Speed</option>
                                    <option value="mhd">Humidity</option>
                                    <option value="mdn">Day or Night</option>
                                    <option value="mat">Airtemp</option>
                                    <option value="mop">Opacity</option>
                                    <option value="met">Estimated Time</option>
                                </optgroup>
                            </select>
                        </td>
                        <td>
                            <select data-width="80px" name="opt">
                                <option value="oeq">=</option>
                                <option value="olt">&lt;</option>
                                <option value="olq">&lt;=</option>
                                <option value="ogt">&gt;</option>
                                <option value="ogq">&gt;=</option>
                                <option value="onot">!=</option>
                                <option value="olk">like</option>
                                <option value="onlk">not like</option>
                            </select>
                        </td>
                        <td>
                            <input type="text" class="form-control" aria-label="Condition" name="cond"
                                   placeholder="Condition">
                        </td>
                        <td>
                            <button type="button" class="close" onclick="deleteSrchItem(this)" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer search_opt_but">
                <button type="button" class="btn btn-default" onclick="clearSrchArray()">Clear</button>
                <button type="button" class="btn btn-default" onclick="addSrchItem()">New Item</button>
                <button type="button" class="btn btn-primary" onclick="msbAdvancedSearch()">Search</button>
            </div>
        </div>
    </div>
</div>