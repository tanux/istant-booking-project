/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - Booking.as.
 */

package model.vo
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.EventDispatcher;
import mx.collections.ArrayCollection;
import mx.events.PropertyChangeEvent;

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
    private var _internal_cancelled : Object;

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

    [Bindable(event="propertyChange")]
    public function get cancelled() : Object
    {
        return _internal_cancelled;
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

    public function set cancelled(value:Object) : void
    {
        var oldValue:Object = _internal_cancelled;
        if (oldValue !== value)
        {
            _internal_cancelled = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "cancelled", oldValue, _internal_cancelled));
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


}

}
