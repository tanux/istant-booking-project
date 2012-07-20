/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - Booking.as.
 */

package model.vo
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.util.FiberUtils;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.Event;
import flash.events.EventDispatcher;
import mx.binding.utils.ChangeWatcher;
import mx.collections.ArrayCollection;
import mx.events.PropertyChangeEvent;
import mx.validators.ValidationResult;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_Booking extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
        try
        {
            if (flash.net.getClassByAlias("Booking") == null)
            {
                flash.net.registerClassAlias("Booking", cz);
            }
        }
        catch (e:Error)
        {
            flash.net.registerClassAlias("Booking", cz);
        }
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
    }

    model_internal var _dminternal_model : _BookingEntityMetadata;
    model_internal var _changedObjects:mx.collections.ArrayCollection = new ArrayCollection();

    public function getChangedObjects() : Array
    {
        _changedObjects.addItemAt(this,0);
        return _changedObjects.source;
    }

    public function clearChangedObjects() : void
    {
        _changedObjects.removeAll();
    }

    /**
     * properties
     */
    private var _internal_id : Object;
    private var _internal_idAffiliate : Object;
    private var _internal_idManager : Object;
    private var _internal_idCustomer : Object;
    private var _internal_idLocation : Object;
    private var _internal_visitDay : Object;
    private var _internal_visitHour : Object;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_Booking()
    {
        _model = new _BookingEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "id", model_internal::setterListenerId));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "idAffiliate", model_internal::setterListenerIdAffiliate));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "idManager", model_internal::setterListenerIdManager));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "idCustomer", model_internal::setterListenerIdCustomer));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "idLocation", model_internal::setterListenerIdLocation));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "visitDay", model_internal::setterListenerVisitDay));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "visitHour", model_internal::setterListenerVisitHour));

    }

    /**
     * data/source property getters
     */

    [Bindable(event="propertyChange")]
    public function get id() : Object
    {
        return _internal_id;
    }

    [Bindable(event="propertyChange")]
    public function get idAffiliate() : Object
    {
        return _internal_idAffiliate;
    }

    [Bindable(event="propertyChange")]
    public function get idManager() : Object
    {
        return _internal_idManager;
    }

    [Bindable(event="propertyChange")]
    public function get idCustomer() : Object
    {
        return _internal_idCustomer;
    }

    [Bindable(event="propertyChange")]
    public function get idLocation() : Object
    {
        return _internal_idLocation;
    }

    [Bindable(event="propertyChange")]
    public function get visitDay() : Object
    {
        return _internal_visitDay;
    }

    [Bindable(event="propertyChange")]
    public function get visitHour() : Object
    {
        return _internal_visitHour;
    }

    public function clearAssociations() : void
    {
    }

    /**
     * data/source property setters
     */

    public function set id(value:Object) : void
    {
        var oldValue:Object = _internal_id;
        if (oldValue !== value)
        {
            _internal_id = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "id", oldValue, _internal_id));
        }
    }

    public function set idAffiliate(value:Object) : void
    {
        var oldValue:Object = _internal_idAffiliate;
        if (oldValue !== value)
        {
            _internal_idAffiliate = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "idAffiliate", oldValue, _internal_idAffiliate));
        }
    }

    public function set idManager(value:Object) : void
    {
        var oldValue:Object = _internal_idManager;
        if (oldValue !== value)
        {
            _internal_idManager = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "idManager", oldValue, _internal_idManager));
        }
    }

    public function set idCustomer(value:Object) : void
    {
        var oldValue:Object = _internal_idCustomer;
        if (oldValue !== value)
        {
            _internal_idCustomer = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "idCustomer", oldValue, _internal_idCustomer));
        }
    }

    public function set idLocation(value:Object) : void
    {
        var oldValue:Object = _internal_idLocation;
        if (oldValue !== value)
        {
            _internal_idLocation = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "idLocation", oldValue, _internal_idLocation));
        }
    }

    public function set visitDay(value:Object) : void
    {
        var oldValue:Object = _internal_visitDay;
        if (oldValue !== value)
        {
            _internal_visitDay = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "visitDay", oldValue, _internal_visitDay));
        }
    }

    public function set visitHour(value:Object) : void
    {
        var oldValue:Object = _internal_visitHour;
        if (oldValue !== value)
        {
            _internal_visitHour = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "visitHour", oldValue, _internal_visitHour));
        }
    }

    /**
     * Data/source property setter listeners
     *
     * Each data property whose value affects other properties or the validity of the entity
     * needs to invalidate all previously calculated artifacts. These include:
     *  - any derived properties or constraints that reference the given data property.
     *  - any availability guards (variant expressions) that reference the given data property.
     *  - any style validations, message tokens or guards that reference the given data property.
     *  - the validity of the property (and the containing entity) if the given data property has a length restriction.
     *  - the validity of the property (and the containing entity) if the given data property is required.
     */

    model_internal function setterListenerId(value:flash.events.Event):void
    {
        _model.invalidateDependentOnId();
    }

    model_internal function setterListenerIdAffiliate(value:flash.events.Event):void
    {
        _model.invalidateDependentOnIdAffiliate();
    }

    model_internal function setterListenerIdManager(value:flash.events.Event):void
    {
        _model.invalidateDependentOnIdManager();
    }

    model_internal function setterListenerIdCustomer(value:flash.events.Event):void
    {
        _model.invalidateDependentOnIdCustomer();
    }

    model_internal function setterListenerIdLocation(value:flash.events.Event):void
    {
        _model.invalidateDependentOnIdLocation();
    }

    model_internal function setterListenerVisitDay(value:flash.events.Event):void
    {
        _model.invalidateDependentOnVisitDay();
    }

    model_internal function setterListenerVisitHour(value:flash.events.Event):void
    {
        _model.invalidateDependentOnVisitHour();
    }


    /**
     * valid related derived properties
     */
    model_internal var _isValid : Boolean;
    model_internal var _invalidConstraints:Array = new Array();
    model_internal var _validationFailureMessages:Array = new Array();

    /**
     * derived property calculators
     */

    /**
     * isValid calculator
     */
    model_internal function calculateIsValid():Boolean
    {
        var violatedConsts:Array = new Array();
        var validationFailureMessages:Array = new Array();

        var propertyValidity:Boolean = true;
        if (!_model.idIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_idValidationFailureMessages);
        }
        if (!_model.idAffiliateIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_idAffiliateValidationFailureMessages);
        }
        if (!_model.idManagerIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_idManagerValidationFailureMessages);
        }
        if (!_model.idCustomerIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_idCustomerValidationFailureMessages);
        }
        if (!_model.idLocationIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_idLocationValidationFailureMessages);
        }
        if (!_model.visitDayIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_visitDayValidationFailureMessages);
        }
        if (!_model.visitHourIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_visitHourValidationFailureMessages);
        }

        model_internal::_cacheInitialized_isValid = true;
        model_internal::invalidConstraints_der = violatedConsts;
        model_internal::validationFailureMessages_der = validationFailureMessages;
        return violatedConsts.length == 0 && propertyValidity;
    }

    /**
     * derived property setters
     */

    model_internal function set isValid_der(value:Boolean) : void
    {
        var oldValue:Boolean = model_internal::_isValid;
        if (oldValue !== value)
        {
            model_internal::_isValid = value;
            _model.model_internal::fireChangeEvent("isValid", oldValue, model_internal::_isValid);
        }
    }

    /**
     * derived property getters
     */

    [Transient]
    [Bindable(event="propertyChange")]
    public function get _model() : _BookingEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _BookingEntityMetadata) : void
    {
        var oldValue : _BookingEntityMetadata = model_internal::_dminternal_model;
        if (oldValue !== value)
        {
            model_internal::_dminternal_model = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_model", oldValue, model_internal::_dminternal_model));
        }
    }

    /**
     * methods
     */


    /**
     *  services
     */
    private var _managingService:com.adobe.fiber.services.IFiberManagingService;

    public function set managingService(managingService:com.adobe.fiber.services.IFiberManagingService):void
    {
        _managingService = managingService;
    }

    model_internal function set invalidConstraints_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_invalidConstraints;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_invalidConstraints = value;
            _model.model_internal::fireChangeEvent("invalidConstraints", oldValue, model_internal::_invalidConstraints);
        }
    }

    model_internal function set validationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_validationFailureMessages;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_validationFailureMessages = value;
            _model.model_internal::fireChangeEvent("validationFailureMessages", oldValue, model_internal::_validationFailureMessages);
        }
    }

    model_internal var _doValidationCacheOfId : Array = null;
    model_internal var _doValidationLastValOfId : Object;

    model_internal function _doValidationForId(valueIn:Object):Array
    {
        var value : Object = valueIn as Object;

        if (model_internal::_doValidationCacheOfId != null && model_internal::_doValidationLastValOfId == value)
           return model_internal::_doValidationCacheOfId ;

        _model.model_internal::_idIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isIdAvailable && _internal_id == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "id is required"));
        }

        model_internal::_doValidationCacheOfId = validationFailures;
        model_internal::_doValidationLastValOfId = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfIdAffiliate : Array = null;
    model_internal var _doValidationLastValOfIdAffiliate : Object;

    model_internal function _doValidationForIdAffiliate(valueIn:Object):Array
    {
        var value : Object = valueIn as Object;

        if (model_internal::_doValidationCacheOfIdAffiliate != null && model_internal::_doValidationLastValOfIdAffiliate == value)
           return model_internal::_doValidationCacheOfIdAffiliate ;

        _model.model_internal::_idAffiliateIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isIdAffiliateAvailable && _internal_idAffiliate == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "idAffiliate is required"));
        }

        model_internal::_doValidationCacheOfIdAffiliate = validationFailures;
        model_internal::_doValidationLastValOfIdAffiliate = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfIdManager : Array = null;
    model_internal var _doValidationLastValOfIdManager : Object;

    model_internal function _doValidationForIdManager(valueIn:Object):Array
    {
        var value : Object = valueIn as Object;

        if (model_internal::_doValidationCacheOfIdManager != null && model_internal::_doValidationLastValOfIdManager == value)
           return model_internal::_doValidationCacheOfIdManager ;

        _model.model_internal::_idManagerIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isIdManagerAvailable && _internal_idManager == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "idManager is required"));
        }

        model_internal::_doValidationCacheOfIdManager = validationFailures;
        model_internal::_doValidationLastValOfIdManager = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfIdCustomer : Array = null;
    model_internal var _doValidationLastValOfIdCustomer : Object;

    model_internal function _doValidationForIdCustomer(valueIn:Object):Array
    {
        var value : Object = valueIn as Object;

        if (model_internal::_doValidationCacheOfIdCustomer != null && model_internal::_doValidationLastValOfIdCustomer == value)
           return model_internal::_doValidationCacheOfIdCustomer ;

        _model.model_internal::_idCustomerIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isIdCustomerAvailable && _internal_idCustomer == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "idCustomer is required"));
        }

        model_internal::_doValidationCacheOfIdCustomer = validationFailures;
        model_internal::_doValidationLastValOfIdCustomer = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfIdLocation : Array = null;
    model_internal var _doValidationLastValOfIdLocation : Object;

    model_internal function _doValidationForIdLocation(valueIn:Object):Array
    {
        var value : Object = valueIn as Object;

        if (model_internal::_doValidationCacheOfIdLocation != null && model_internal::_doValidationLastValOfIdLocation == value)
           return model_internal::_doValidationCacheOfIdLocation ;

        _model.model_internal::_idLocationIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isIdLocationAvailable && _internal_idLocation == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "idLocation is required"));
        }

        model_internal::_doValidationCacheOfIdLocation = validationFailures;
        model_internal::_doValidationLastValOfIdLocation = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfVisitDay : Array = null;
    model_internal var _doValidationLastValOfVisitDay : Object;

    model_internal function _doValidationForVisitDay(valueIn:Object):Array
    {
        var value : Object = valueIn as Object;

        if (model_internal::_doValidationCacheOfVisitDay != null && model_internal::_doValidationLastValOfVisitDay == value)
           return model_internal::_doValidationCacheOfVisitDay ;

        _model.model_internal::_visitDayIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isVisitDayAvailable && _internal_visitDay == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "visitDay is required"));
        }

        model_internal::_doValidationCacheOfVisitDay = validationFailures;
        model_internal::_doValidationLastValOfVisitDay = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfVisitHour : Array = null;
    model_internal var _doValidationLastValOfVisitHour : Object;

    model_internal function _doValidationForVisitHour(valueIn:Object):Array
    {
        var value : Object = valueIn as Object;

        if (model_internal::_doValidationCacheOfVisitHour != null && model_internal::_doValidationLastValOfVisitHour == value)
           return model_internal::_doValidationCacheOfVisitHour ;

        _model.model_internal::_visitHourIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isVisitHourAvailable && _internal_visitHour == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "visitHour is required"));
        }

        model_internal::_doValidationCacheOfVisitHour = validationFailures;
        model_internal::_doValidationLastValOfVisitHour = value;

        return validationFailures;
    }
    

}

}
